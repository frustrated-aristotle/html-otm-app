function signOut()
{
    localStorage.setItem("uid","");
    alert("Successfully signed out");
    window.location.href = "index.html";
}

