#!/bin/bash

# 第一引数からファイルパスを取得します
FILE_PATH=$1

# ファイルが存在するかどうか確認します
if [ ! -f "$FILE_PATH" ]; then
    echo "ファイルが存在しません: $FILE_PATH"
    exit 1
fi

# tsvファイルから1列目の各要素を抽出します
SAMPLE_NAMES=$(awk -F'\t' 'NR>1 {print $1}' "$FILE_PATH")
TOTAL_SAMPLES=$(echo "$SAMPLE_NAMES" | wc -l)
COUNTER=0

echo "$SAMPLE_NAMES" | while read SAMPLE_NAME
do
    COUNTER=$((COUNTER+1))
    echo "ダウンロードを開始します: $SAMPLE_NAME ($COUNTER/$TOTAL_SAMPLES)"

    # "data"ディレクトリ内に SAMPLE_NAME の名前でディレクトリを作成します
    mkdir -p data/$SAMPLE_NAME

    # 各ファイルのダウンロード
    for FILE in PAR.g.vcf.gz.tbi PAR.g.vcf.gz autosome.g.vcf.gz autosome.g.vcf.gz.tbi chrX.g.vcf.gz chrX.g.vcf.gz.tbi
    do
        URL="https://ddbj.nig.ac.jp/public/public-human-genomes/GRCh38/1000Genomes/GVCF/$SAMPLE_NAME/$SAMPLE_NAME.$FILE"
        curl -o data/$SAMPLE_NAME/$SAMPLE_NAME.$FILE $URL
        if [ $? -eq 0 ]; then
            echo "$SAMPLE_NAME.$FILE のダウンロードが完了しました"
        else
            echo "$SAMPLE_NAME.$FILE のダウンロードに失敗しました"
        fi
    done
done
