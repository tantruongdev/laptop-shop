<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title> Order ${id} - SB Admin</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
  <jsp:include page="../layout/header.jsp" />
  <div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
      <main>
        <div class="container-fluid px-4">
          <h1 class="mt-4">Manage Orders</h1>
          <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active" aria-current="page">Orders</li>
              <li class="breadcrumb-item active" aria-current="page">${id}</li>
            </ol>
          </nav>

          <div class="mt-5">
            <a href="/admin/order" class="btn btn-primary my-2">Back</a>
            <div class="row">
              <div class="col-12 mx-auto">
                <div class="d-flex justify-content-between">
                  <h2>Order ${order.id}</h2>
                  <a class="btn btn-primary" href="/admin/order/update/${id}">Edit Order</a>
                </div>

                <hr>

                <!-- Cart Page Start -->
                <div class="container-fluid">
                  <div class="container ">
                    <c:if test="${empty orderDetails}">
                      <div class="text-center">
                        <p class="mb-2">Không có sản phẩm trong đơn hàng</p>
                        <a href="/admin/order" class="btn btn-primary">Quay lại</a>
                      </div>
                    </c:if>
                    <c:if test="${not empty orderDetails}">
                      <div class="table-responsive">
                        <table class="table">
                          <thead>
                            <tr>
                              <th scope="col">Sản phẩm</th>
                              <th scope="col">Tên</th>
                              <th scope="col">Giá cả</th>
                              <th scope="col">Số lượng</th>
                              <th scope="col">Thành tiền</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="orderDetail" items="${orderDetails}" varStatus="status">
                              <tr>
                                <th scope="row">
                                  <div class="d-flex align-items-center">
                                    <img src="/images/product/${orderDetail.product.image}"
                                      class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                  </div>
                                </th>
                                <td>
                                  <p class="mb-0 mt-4">
                                    <a href="/product/${orderDetail.product.id}" target="_blank">
                                      ${orderDetail.product.name}
                                    </a>
                                  </p>
                                </td>
                                <td>
                                  <p class="mb-0 mt-4">
                                    <fmt:formatNumber type="number" value="${orderDetail.price}" /> đ
                                  </p>
                                </td>
                                <td>
                                  <p class="mb-0 mt-4">
                                    ${orderDetail.quantity}
                                  </p>
                                </td>
                                <td>
                                  <p class="mb-0 mt-4" data-cart-detail-id="${orderDetail.id}">
                                    <fmt:formatNumber type="number"
                                      value="${orderDetail.price * orderDetail.quantity}" />
                                    đ
                                  </p>
                                </td>
                              </tr>
                            </c:forEach>

                          </tbody>
                        </table>
                      </div>
                    </c:if>
                  </div>
                </div>
                <!-- Cart Page End -->

              </div>
            </div>
          </div>

        </div>
      </main>
      <jsp:include page="../layout/footer.jsp" />
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
  </script>
  <script src="/js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="/js/chart-area-demo.js"></script>
  <script src="/js/chart-bar-demo.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
    crossorigin="anonymous"></script>
  <script src="/js/datatables-simple-demo.js"></script>
</body>

</html>