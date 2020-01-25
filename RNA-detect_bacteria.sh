#!/bin/bash

if [ $# -eq 0 ]; then
    echo "usage: RNA-detect.sh in.fasta"
    echo ""
    echo "Notes:"
    echo "- Needs bsub (-n 4 and -g /alex_rnas)"
    echo "- Output files will be created in the location of the input"
    exit 1
fi

fasta=${1}
cm_db="/hps/nobackup2/production/metagenomics/aalmeida/databases/rfam_cms/bacteria/"

echo "[ Detecting rRNAs ]"
for f in ${cm_db}/*.cm
do 
    echo "Running cmsearch for $(basename ${f})..."
    cmsearch -Z 1000 --hmmonly --cut_ga --cpu 4 --noali --tblout ${fasta%%.f*}"_"$(basename ${f}).tblout ${f} ${fasta} > ${fasta%%.f*}"_"$(basename ${f}).out
done

echo "Concatenating results..."
cat ${fasta%%.f*}"_"*.tblout > ${fasta%%.f*}"_"all.tblout

echo "Removing overlaps..."
/hps/nobackup2/production/metagenomics/production-scripts/current/mgportal/analysis-pipeline/python/tools/RNASelection/scripts/cmsearch-deoverlap.pl --maxkeep --clanin /hps/nobackup2/production/metagenomics/production-scripts/current/mgportal/analysis-pipeline/python/tools/RNASelection/model-data/Rfam/ribosomal/claninfo/ribo.claninfo ${fasta%%.f*}"_"all.tblout

echo "Parsing final results..."
parse_rRNA-bacteria.py ${fasta%%.f*}"_"all.tblout.deoverlapped > ${fasta%%.f*}"_"rRNAs.out
rRNA2seq.py ${fasta%%.f*}"_"all.tblout.deoverlapped ${fasta} > ${fasta%%.f*}"_"rRNAs.fasta

echo "[ Detecting tRNAs ]"
tRNAscan-SE -B -Q -m ${fasta%%.f*}_stats.out -o ${fasta%%.f*}_trna.out ${fasta}
parse_tRNA.py ${fasta%%.f*}_stats.out > ${fasta%%.f*}_tRNA_20aa.out

echo "Cleaning tmp files..."
rm ${fasta%%.f*}"_"all.tblout.deoverlapped ${fasta%%.f*}"_"all.tblout ${fasta%%.f*}"_"all.tblout.sort ${fasta%%.f*}"_"*.cm.*out ${fasta%%.f*}_stats.out ${fasta%%.f*}_trna.out
