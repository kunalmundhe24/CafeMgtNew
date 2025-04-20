<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Billing</title>
        <style>
            /* Define your CSS styles here */
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #006241;
                color: #fff;
                padding: 20px;
                text-align: center;
            }

            main {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .order-details, .payment-details {
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 5px;
            }

            .totat{
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
            }

            button {
                background-color: #006241;
                color: #fff;
                padding: 10px 20px;
                border: none;
                cursor: pointer;
            }

            button:hover {
                background-color: #004f3d;
            }

            footer {
                background-color: #006241;
                color: #fff;
                text-align: center;
                padding: 10px;
            }
        </style>
    </head><body>
        <header>
            <h1>Billing Page</h1>
        </header>

        <main>
            <form method="post" action="test.jsp" onsubmit="return validateForm()">

                <section class="order-details">
                    <h2>Your Order</h2>
                    <table>
                        <tr>
                            <th>Item</th>
                            <th>Quantity</th>
                            <th>Amount</th>
                        </tr>
                        <tr>

                            <td><input type="text" name="item" required></td>
                            <td><input type="number" name="quantity" id="quantity" required min="1" oninput="calculateTotal()"></td>
                            <td><input type="number" name="amount" id="amount" required min="1" oninput="calculateTotal()"></td>

                        </tr>
                        <tr>
                            <td id="total" class="total">Total = 0</td>
                        </tr>
                        <!-- You can add more rows for additional items if needed -->
                    </table>
                </section>
                <section class="payment-details">
                    <h2>Payment Details</h2>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required>
                    <br>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                    <br>

                    <label for="card-number">Card Number:</label>
                    <input type="text" id="card-number" name="card-number" required>
                    <br>

                    <label for="expiration">Expiration Date:</label>
                    <input type="text" id="expiration" name="expiration" required>
                    <br>

                    <label for="cvv">CVV:</label>
                    <input type="text" id="cvv" name="cvv" required>
                    <br>

                    <button type="submit">Submit Payment</button>
                </section>
            </form>
        </main>

        <footer>
            &copy; 2023 Cafe. All rights reserved.
        </footer>
        <script>
                    function calculateTotal() {
                    const quantity = parseFloat(document.getElementById("quantity").value);
                            const amount = parseFloat(document.getElementById("amount").value);
                            const total = quantity * amount;
                            document.getElementById("total").textContent = "Total = " + total;
                    }
            function validateForm() {
            // Get the values from the input fields
            var cardNumber = document.getElementById("card-number").value;
                    var expiration = document.getElementById("expiration").value;
                    var cvv = document.getElementById("cvv").value;
                    // Regular expressions for validation
                    var cardNumberRegex = /^\d{16}$/; // Assumes 16-digit card numbers
                    var expirationRegex = /^(0[1-9]|1[0-2])\/\d{2}$/; // MM/YY format
                    var cvvRegex = /^\d{3}$/; // Assumes 3-digit CVV

                    // Perform validation
                    if (!cardNumber.match(cardNumberRegex)) {
            alert("Please enter a valid 16-digit card number.");
                    return false;
            }

            if (!expiration.match(expirationRegex)) {
            alert("Please enter a valid expiration date in MM/YY format.");
                    return false;
            }

            if (!cvv.match(cvvRegex)) {
            alert("Please enter a valid 3-digit CVV.");
                    return false;
            }

            // If all validations pass, the form will be submitted
            return true;
            }
        </script>
    </body>
</html>

