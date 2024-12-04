#!/bin/bash
gunzip gencode.v41.basic.annotation.gff3
awk '$3 == "gene"'  gencode.v41.basic.annotation.gff3 > filtered_genes.tsv
awk -F'\t' '$9 ~ /gene_type=unprocessed_pseudogene/ {print $1"\t"$4"\t"$5"\t"$7"\t"$9}' "$1" gencode.v41.basic.annotation.gff3 > filtered_genes.tsv
cut -f9 gencode.v41.basic.annotation.gff3 | sed 's/.*gene_name=\([^;]*\).*/\1/' >  filtered_genes.tsv

awk 'BEGIN { FS = OFS = "\t" } { if ($4 == "+") { $3 = $3 + 1 } print }' filtered_genes.tsv > temp.tsv && mv temp.tsv filtered_genes.tsv

awk 'BEGIN { FS = OFS = "\t" } { if ($4 == "-") { temp = $2; $2 = $3; $3 = temp; $4 = "+"; $3 = $3 + 1 } print }' filtered_genes.tsv > result.tsv

mv result.tsv results/

