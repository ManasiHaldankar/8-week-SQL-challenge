**Problem Statement**

Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

Danny has shared with you 3 key datasets for this case study:

**Table 1: sales**
The sales table captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.

![image](https://github.com/ManasiHaldankar/8-week-SQL-challenge/assets/90810075/d58643d6-51aa-4990-991e-e339c2703d88)

**Table 2: menu**
The menu table maps the product_id to the actual product_name and price of each menu item.

![image](https://github.com/ManasiHaldankar/8-week-SQL-challenge/assets/90810075/cc5b013d-272f-4ccc-96a8-66a7d65bb705)

**Table 3: members**
The final members table captures the join_date when a customer_id joined the beta version of the Danny’s Diner loyalty program.

![image](https://github.com/ManasiHaldankar/8-week-SQL-challenge/assets/90810075/c817da8e-9229-4e84-b6a0-8355591a5d9a)

**Case Study Questions**

What is the total amount each customer spent at the restaurant?

How many days has each customer visited the restaurant?

What was the first item from the menu purchased by each customer?

What is the most purchased item on the menu and how many times was it purchased by all customers?

Which item was the most popular for each customer?

Which item was purchased first by the customer after they became a member?

Which item was purchased just before the customer became a member?

What is the total items and amount spent for each member before they became a member?

If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

**--Bonus Questions**

Recreate the following table output using the available data:

![image](https://github.com/ManasiHaldankar/8-week-SQL-challenge/assets/90810075/e13f6b96-363a-4a94-94cb-459ba2f2a974)

Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.

![image](https://github.com/ManasiHaldankar/8-week-SQL-challenge/assets/90810075/afb9793c-6041-455b-a774-fbf7d247c2c3)

