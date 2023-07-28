# joint-call
## DL_japan105
* 実行コマンド
```sh
$ chmod +x src/dl_list.sh
$ ./src/dl_list.sh data/igsr-jpt.tsv.tsv
```
* 説明
    * data/igsr-jpt.tsv.tsvの1列目に記載されている104人分に関して、[GATKフォルダ](https://ddbj.nig.ac.jp/public/public-human-genomes/GRCh38/1000Genomes/GVCF/)以下のデータをダウンロードする。
        * NA18955は除外したため、105名から1名減って104名。
    * igsr-jpt.tsv.tsvは[IGSR: The International Genome Sample Resource](https://www.internationalgenome.org/data-portal/population/JPT)から入手。
    * 読み込んだファイルの1列目を見ているだけなので、igsr-jpt.tsv.tsvの1列目の記述を変更すればダウンロード対象を変更できる。
    * 総計約788GB（104サンプル）になるため、ダウンロード先のデータ容量に注意。
    * 「data/NAxxxxx」という形でsampleごとにディレクトリが作成され、各ファイルダウンロード。
    * ダウンロードされるファイルは下記６つ。約5~10GB。
        * PAR.g.vcf.gz.tbi
        * PAR.g.vcf.gz
        * autosome.g.vcf.gz
        * autosome.g.vcf.gz.tbi
        * chrX.g.vcf.gz
        * chrX.g.vcf.gz.tbi