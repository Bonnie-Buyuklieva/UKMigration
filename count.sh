cd /home/ubuntu/ComplexSystems/QuantEpistemo/Models/UKMigration

TOTAL=`mongo ukmigration --quiet --eval "db.references.count()"`
LINKS=`mongo ukmigration --quiet --eval "db.links.count()"`
REMAINING=`mongo ukmigration --quiet --eval 'db.references.find({"citingFilled":false,"depth":{$gt:0}}).count()'`
DATE=`date +%s`

echo "$TOTAL;$LINKS;$REMAINING"

echo "$DATE;$TOTAL;$LINKS;$REMAINING" >> progress.txt
