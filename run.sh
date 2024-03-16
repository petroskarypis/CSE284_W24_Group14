#!/bin/bash

set -e

TARGETVCF=~/public/misc/mgymrek_genome.vcf.gz

prefix=$(basename $TARGETVCF .vcf.gz)
data_filepath=./data/$prefix

# Download beagle and impute2
# wget https://faculty.washington.edu/browning/beagle/beagle.19Apr22.7c0.jar
# wget https://mathgen.stats.ox.ac.uk/impute/impute_v2.3.2_x86_64_static.tgz
# tar -zxvf impute_v2.3.2_x86_64_static.tgz

# Fix 23andme VCF
zcat ${TARGETVCF} | \
awk '/^#/ {print; next} {print toupper($0)}' | \
bgzip -c > ${data_filepath}_fixcase.vcf.gz
tabix -p vcf ${data_filepath}_fixcase.vcf.gz

# Convert into Oxford format
# # Option 1: convert manually
# # Convert to plink format
# vcftools --gzvcf ${data_filepath}_fixcase.vcf.gz --plink --out ${data_filepath}_fixcase
# # Convert to oxford format
# plink --file ${data_filepath}_fixcase --recode oxford --out ${data_filepath}_fixcase
# Option 2: use script
perl -vcf ${data_filepath}_fixcase.vcf -gen ${data_filepath}_fixcase.gen

# touch excludemarkers.txt
echo "8:89329148" >> excludemarkers.txt
echo "12:8400000" >> excludemarkers.txt
echo "14:21649957" >> excludemarkers.txt
echo "17:1144632" >> excludemarkers.txt
KGDIR=~/public/1000Genomes/

# # Run beagle
mkdir -p beagle
echo "Imputing chr${chrom} using Beagle"
time java -jar beagle.19Apr22.7c0.jar \
    chrom=1:1-5000000 \
    gt=${data_filepath}_fixcase.vcf.gz \
    ref=${KGDIR}/ALL.chr1.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz \
    excludemarkers=excludemarkers.txt \
    out=./beagle/${prefix}_imputed_chr1
