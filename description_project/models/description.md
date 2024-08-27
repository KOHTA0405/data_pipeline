{% docs table__raw_customers %}
顧客テーブル
{% enddocs %}
{% docs column__raw_customers__id %}
顧客テーブルの主キー
{% enddocs %}
{% docs column__raw_customers__first_name %}
顧客名
{% enddocs %}
{% docs column__raw_customers__last_name %}
顧客姓
{% enddocs %}

{% docs table__raw_orders %}
注文テーブル
{% enddocs %}
{% docs column__raw_orders__id %}
注文テーブルの主キーとしてのid
{% enddocs %}
{% docs column__raw_orders__user_id %}
注文したユーザーのID。顧客テーブルに紐づく。
{% enddocs %}
{% docs column__raw_orders__order_date %}
注文日
{% enddocs %}
{% docs column__raw_orders__status %}
注文ステータス。
- placed
- shipped
- completed
- return_pending
- returned
{% enddocs %}

{% docs table__raw_payments %}
支払いテーブル
{% enddocs %}
{% docs column__raw_payments__id %}
支払いテーブルの主キー
{% enddocs %}
{% docs column__raw_payments__order_id %}
注文ID。注文テーブルに紐づく。
{% enddocs %}
{% docs column__raw_payments__payment_method %}
支払い方法。
- credit_card
- coupon
- bank_transfer
- gift_card
{% enddocs %}
{% docs column__raw_payments__amount %}
支払い金額
{% enddocs %}