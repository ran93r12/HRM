const form = document.getElementById("form");
const form2 = document.getElementById("form2");
const email = document.getElementById("email");
const email2 = document.getElementById("email2");
const password1 = document.getElementById("password1");
const password = document.getElementById("password");
const password2 = document.getElementById("password2");
form2.addEventListener("submit", e => {
    e.preventDefault();

    validateInputs();
});

form.addEventListener("submit", e => {
    e.preventDefault();
    validateLoginInputs();
});

function validateInputs() {
    const emailVal = email2.value.trim();
    const passwordVal = password.value.trim();
    const password2Val = password2.value.trim();

    if (emailVal === "") {
        setErrorForInput(email2, "Email cannot be blank");
    } else {
        setSuccessForInput(email2);
    }

    if (passwordVal.length < 5) {
        setErrorForInput(password, "Password should contain at least 5 characters");
    } else {
        setSuccessForInput(password);
    }

    if (password2Val === "" || password2Val !== passwordVal) {
        setErrorForInput(password2, "Passwords should match");
    } else {
        setSuccessForInput(password2);
    }
}

function validateLoginInputs() {
    const emailVal = email.value.trim();
    const passwordVal = password1.value.trim();

    if (emailVal === "") {
        setErrorForInput(email, "Email cannot be blank");
    } else {
        setSuccessForInput(email);
    }

    if (passwordVal.length < 5) {
        setErrorForInput(
            password1,
            "Password should contain at least 5 characters"
        );
    } else {
        setSuccessForInput(password1);
    }
}

email2.addEventListener("blur", e => {
    if (e.target.value.length < 5) {
        setError(email2);
    } else {
        setSuccessForInput(email2);
    }
});

email.addEventListener("blur", e => {
    if (e.target.value === "") {
        setError(email);
    } else {
        setSuccessForInput(email);
    }
});

password1.addEventListener("blur", e => {
    if (e.target.value.length < 5 || !e.target.value.isNumber()) {
        setError(password1);
    } else {
        setSuccessForInput(password1);
    }
});

password.addEventListener("change", e => {
    progress.value = e.target.value.length * 10;
});

password.addEventListener("blur", e => {
    if (e.target.value.length < 5) {
        setError(password);
    } else {
        setSuccessForInput(password);
    }
});

password2.addEventListener("blur", e => {
    if (e.target.value.length < 5) {
        setError(password2);
    } else {
        setSuccessForInput(password2);
    }
});

function setErrorForInput(input, message) {
    const formControl = input.parentElement;
    const smallTag = formControl.querySelector("small");

    smallTag.innerText = message;
    formControl.className = "form-control error";
    return false;
}

function setErrorForRadio(input, message) {
    const formControl = input.parentElement;
    const smallTag = formControl.querySelector("small");

    smallTag.innerText = message;
    formControl.className = "radios error";
    return false;
}

function setSuccessForInput(input) {
    const formControl = input.parentElement;
    formControl.className = "form-control success";
}

function setError(input) {
    const formControl = input.parentElement;
    formControl.className = "form-control error";
    return true;
}
String.prototype.isNumber = function() {
    return /^\d+$/.test(this);
};