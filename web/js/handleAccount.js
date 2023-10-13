const loginForm = document.getElementById("loginForm");
    const usernameField = document.getElementById("username");
    const passwordField = document.getElementById("password");

    loginForm.addEventListener("submit", function(event) {
        if (!usernameField.checkValidity() || !passwordField.checkValidity()) {
            event.preventDefault();
            if (!usernameField.checkValidity()) {
                usernameField.setCustomValidity("Please enter a valid username.");
            }
            if (!passwordField.checkValidity()) {
                passwordField.setCustomValidity("Please enter a valid password.");
            }
        }
    });

    usernameField.addEventListener("input", function() {
        usernameField.setCustomValidity("");
        usernameField.checkValidity();
    });

    passwordField.addEventListener("input", function() {
        passwordField.setCustomValidity("");
        passwordField.checkValidity();
    });

    usernameField.addEventListener("invalid", function() {
        usernameField.setCustomValidity("Please enter a valid username.");
    });

    passwordField.addEventListener("invalid", function() {
        passwordField.setCustomValidity("Please enter a valid password.");
    });