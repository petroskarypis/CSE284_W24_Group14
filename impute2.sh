mkdir -p impute2
cd impute_v2.3.2_x86_64_static
# TODO: Prepare the gens file and mimic the following
# skipped stranding cmd: -strand_g ./Example/example.chr22.study.strand \
time ./impute2 \
 -m ../data/genetic_map_chr1_combined_b37.txt \
 -h ../data/1000GP_Phase3_chr1.hap \
 -l ../data/1000GP_Phase3_chr1.legend \
 -g ../data/mgymrek_genome_fixcase.gen \
 -align_by_maf_g_ref \
 -int 1 5e6 \
 -Ne 20000 \
 -o ../impute2/mgymrek_genome_phased.impute2

