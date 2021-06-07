<%

session.removeAttribute("cloth_name");

    session.removeAttribute("laundry_price");
    session.removeAttribute("iron_rate");
    session.removeAttribute("total_price");

    session.removeAttribute("order_date");
    session.removeAttribute("cloth_qty");
    session.removeAttribute("payment_mode");
    session.removeAttribute("pick_up_time");
    session.removeAttribute("delivery_time");
    session.removeAttribute("pick_up_date");
    session.removeAttribute("delivery_date");
    session.removeAttribute("payment_mode");
    session.removeAttribute("cc_id");

response.sendRedirect("request_order.jsp");

%>
