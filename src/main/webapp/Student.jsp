<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Student - Form</title>
 <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" type="text/css" href="./style.css" />
</head>
<body>
	 <div class="login-container">
      <h1 class="login-title">Register</h1>
      <div>
        <div class="login-page justify-content-center">
          <!-- <div class="col-lg-1"></div> -->
          <div class="col-lg-6 col-lg-6 left-form-div">
            <div class="login-form">
              <form
                class="login-form"
                action="http://localhost:8080/TECOC311_A6/RegisterStudent.jsp"
                method="POST"
              >
                <div class="login-form-div">
                  <div class="row">
                    <div class="col-md-12">
                      <input
                        class="form-input"
                        id="form-name"
                        type="text"
                        name="name"
                        placeholder="Name"
                      />
                    </div>

                    <div class="col-md-12">
                      <input
                        class="form-input"
                        id="form-email"
                        type="email"
                        name="emailId"
                        placeholder="Email"
                      />
                    </div>

                    <div class="col-md-12">
                      <input
                        class="form-input"
                        id="form-password"
                        type="password"
                        name="password"
                        placeholder="Password"
                      />
                    </div>

                    <div class="col-md-12">
                      <select name="form-action" id="form-action">
                        <option value="">Action</option>
                        <option value="insert">INSERT</option>
                        <option value="select">SELECT</option>
                        <option value="update">UPDATE</option>
                        <option value="delete">DELETE</option>
                      </select>
                    </div>
                  </div>
                  <button class="btn-primary login-btn" type="submit">
                    SUBMIT
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
      crossorigin="anonymous"
    ></script>
</body>
</html>