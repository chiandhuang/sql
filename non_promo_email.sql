email_performance="""
SELECT 
email_id,

DATE_FORMAT(FROM_UNIXTIME(timestamp), '%Y-%m') as sent_month,

COUNT(s.sent_id) as sent, 

SUM(CASE WHEN o.open IS NULL THEN 0 ELSE 1 END) AS open,

SUM(CASE WHEN click=0 THEN 0 ELSE 1 END) AS click,

SUM(CASE WHEN unsubscribe=0 THEN 0 ELSE 1 END) as unsubscribe,

SUM(CASE WHEN conversion=0 THEN 0 ELSE 1 END) as conversion

FROM simplisafe_LIVE.em_sent s

LEFT JOIN (SELECT sent_id, MAX(open_id) AS open FROM simplisafe_LIVE.em_opens o GROUP BY 1 ORDER BY 1) o

ON s.sent_id=o.sent_id

WHERE s.email_id IN 
(245,246,247,380,382,386,388,390,392,394,396,398,400,402,404,406,410,412,484,428,430,432,434,438,436,440,442,444,446,448,450,452,454,456,484,458,460,432,434,440,442,462,448,454,444,450,436,446,456,484,464,1052) 
AND DATE_FORMAT(FROM_UNIXTIME(s.timestamp), '%Y-%m') BETWEEN '2020-02' AND '2021-02'

GROUP BY 1,2
ORDER BY 1

"""
