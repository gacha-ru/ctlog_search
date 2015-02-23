#!/bin/bash

set -eu

SCRIPT_PATH=`dirname ${0}`

# CloudTrailのS3パス用
YEAR=`date +"%Y"`
MONTH=`date +"%m"`
DAY=`date +"%d"`

# AWSアカウント情報は別ファイルで定義
. ${SCRIPT_PATH}/account.conf


# 前回実行時との比較用ファイルを設定
init_files() {

    # LOGディレクトリ作成
    if [ ! -e ${LOG_DIR} ];then
        mkdir -p ${LOG_DIR}
    fi

    # リストファイル設置
    if [ ! -e ${LOG_DIR}/loglist.txt ];then
        touch ${LOG_DIR}/loglist.txt
    fi

    # 以前にDLしたCloudFlontのログファイルを削除
    rm -f ${LOG_DIR}/*.json.gz

    # 前回実行時のファイルリスト(loglist.txt)を(before_loglist.txt)にリネーム
    mv ${LOG_DIR}/loglist.txt ${LOG_DIR}/before_loglist.txt

    # CloudTrailのファイルリストを取得しリスト(loglist.txt)へ
    aws s3 ls --profile ${ACCOUNT} ${TRAIL_DIR}/ |awk '{print $4}' \
    > ${LOG_DIR}/loglist.txt

}


# S3からDLしelasticsearchへ追加
dl_import_logs() {

    # diffで差分を取り、前回実行時から追加されたファイル名をとる
    FILES=`diff ${LOG_DIR}/before_loglist.txt ${LOG_DIR}/loglist.txt |grep ">" |awk '{print $2}'`

    # 改行で一要素とする
    IFS=$'\n'

    ## awscliのS3コマンドでログファイルをダウンロード
    for oneline in $FILES;do
        aws s3 cp --profile ${ACCOUNT} ${TRAIL_DIR}/${oneline} ${LOG_DIR}/ > /dev/null
    done

    # 追加行カウント用
    rows=0

    # 1ファイルごとに1レコードずつelasticsearchへ追加
    for file in ${FILES};do
        length=`zcat ${LOG_DIR}/${file} | jq '.Records | length'`
        index=$(( length - 1 ))
        rows=$(( rows + length ))
        echo ${file}

        for i in `seq 0 ${index}`; do
            log=`zcat ${LOG_DIR}/${file} | jq -c ".Records[${i}]"`
            if [ ! -z "${log}" ]; then
                curl -s -X POST "http://localhost:9200/cloudtrail-${YEAR}${MONTH}${DAY}/${ACCOUNT}/" -d "${log}" > /dev/null
            fi
        done
    done

    echo "ログを${rows}行追加しました"

}


# region毎にimportする
for REGION in ${regions[@]}; do
    echo "REGION : ${REGION}"
    # cloudtrailのS3パス
    TRAIL_DIR="s3://${S3BUCKET}/AWSLogs/${ACID}/CloudTrail/${REGION}/${YEAR}/${MONTH}/${DAY}"
    LOG_DIR="${SCRIPT_PATH}/ctlog/${ACCOUNT}/${REGION}"

    init_files
    dl_import_logs
done
