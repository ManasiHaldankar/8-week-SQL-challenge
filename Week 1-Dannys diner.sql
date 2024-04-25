--What is the total amount each customer spent at the restaurant?
select s.customer_id, sum(m.price) from sales s left join menu m
on s.product_id = m.product_id
group by s.customer_id
order by s.customer_id;

--How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as total_days from sales
group by customer_id;

--What was the first item from the menu purchased by each customer?
with cte as(
	select s.customer_id,
			s.product_id,
			m.product_name,
			dense_rank() over(partition by s.customer_id order by s.order_date) as rn
	from sales s left join menu m
	on s.product_id = m.product_id)
select customer_id, product_name from cte
where rn = 1;

--What is the most purchased item on the menu and how many times was it purchased by all customers?
select m.product_name, count(s.product_id) from sales s left join menu m
on s.product_id = m.product_id
group by s.product_id, m.product_name
order by s.product_id desc limit 1;

--Which item was the most popular for each customer?
with cte as(
	select s.customer_id,
			count(s.product_id),
			m.product_name,
			row_number() over(partition by s.customer_id order by count(s.product_id) desc) as rn
	from sales s left join menu m
	on s.product_id = m.product_id
	group by s.customer_id, m.product_name)
	
select customer_id, product_name from cte where rn = 1;

--Which item was purchased first by the customer after they became a member?
with cte as(
	select s.customer_id, 
			m.product_name, 
			s.order_date, 
			rank() over(partition by s.customer_id order by s.order_date) as rn
	from sales s left join menu m
	on s.product_id = m.product_id
	left join members ms on s.customer_id = ms.customer_id
	where s.order_date > ms.join_date)
	
select customer_id, product_name from cte where rn = 1;

--Which item was purchased just before the customer became a member?
with cte as(
	select s.customer_id, 
			m.product_name, 
			s.order_date, 
			row_number() over(partition by s.customer_id order by s.order_date desc) as rn
	from sales s left join menu m
	on s.product_id = m.product_id
	left join members ms on s.customer_id = ms.customer_id
	where s.order_date < ms.join_date)
	
select customer_id, product_name from cte where rn = 1;

--What is the total items and amount spent for each member before they became a member?
with cte as(
	select s.customer_id, 
			count(s.product_id),
			sum(m.price) as price
	from sales s left join menu m
	on s.product_id = m.product_id
	left join members ms on s.customer_id = ms.customer_id
	where s.order_date < ms.join_date
	group by s.customer_id
	order by s.customer_id)
	
select * from cte;

--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
select s.customer_id, 
sum(case when m.product_name = 'sushi' then m.price*20 else m.price*10 end) as points 
from sales s left join menu m
on s.product_id = m.product_id
group by s.customer_id
order by s.customer_id;

--In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
select s.customer_id, 
sum(case when m.product_name = 'sushi' then m.price*20
	when s.order_date between ms.join_date and (ms.join_date + interval '6 days') then m.price*20
 else m.price*10 end) as points 
from sales s left join menu m
on s.product_id = m.product_id
left join members ms on s.customer_id = ms.customer_id
where s.order_date < '2021-02-01' 
group by s.customer_id
order by s.customer_id;




