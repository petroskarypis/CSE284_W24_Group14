#!/bin/bash

set -e

TARGETVCF=~/public/misc/mgymrek_genome.vcf.gz

prefix=$(basename $TARGETVCF .vcf.gz)
data_filepath=./data/$prefix

# Download beagle
# wget https://faculty.washington.edu/browning/beagle/beagle.19Apr22.7c0.jar

# Fix 23andme VCF
zcat ${TARGETVCF} | \
awk '/^#/ {print; next} {print toupper($0)}' | \
bgzip -c > ${data_filepath}_fixcase.vcf.gz
tabix -p vcf ${data_filepath}_fixcase.vcf.gz

# # Convert to plink format
# vcftools --gzvcf ${data_filepath}_fixcase.vcf.gz --plink --out ${data_filepath}_fixcase
# # Convert to oxford format
# plink --file ${data_filepath}_fixcase --recode oxford --out ${data_filepath}_fixcase

# touch excludemarkers.txt
# echo "8:89329148" >> excludemarkers.txt
# echo "12:8400000" >> excludemarkers.txt
# echo "14:21649957" >> excludemarkers.txt
# echo "17:1144632" >> excludemarkers.txt
# KGDIR=~/public/1000Genomes/

# # Run beagle
# mkdir beagle
# for chrom in $(seq 1 1)
# do
#     echo "Imputing chr${chrom} using Beagle"
#     java -jar beagle.19Apr22.7c0.jar chrom=$chrom \
#         gt=${data_filepath}_fixcase.vcf.gz \
#         ref=${KGDIR}/ALL.chr${chrom}.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz \
#         excludemarkers=excludemarkers.txt \
#         out=./beagle/${prefix}_imputed_chr${chrom}
# done

# # Remove duplicates
# zcat data/imputed_23andme_merged.vcf.gz | grep -v "^#" | cut -f 3 | sort | uniq -c | \
#    awk '{print $1 "\t" $2}' | awk '($1>1)' | grep -v "\." | cut -f 2 > dupids_23andme.txt

# mkdir impute

