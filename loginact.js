document.querySelector("#btn").addEventListener("click", () => {
    const id = "admin";
    const password = "1234";

    if(id == document.querySelector("#id").value) {
        if(password == document.querySelector("#password").value) {

            document.write("환영합니다")
            window.location.assign("main.html") //main.html은 건희 님이 만든 페이지로 이동?
        }
        else {
            alert("비밀번호가 맞지 않습니다.");
        }
    }
    else {
        alert("아이디 혹은 비밀번호가 맞지 않습니다.");
    }
});

document.querySelector("#btn1").addEventListener("click", () => {
  document.write("회원가입")
    window.location.assign("joinact.html")// 회원가입 페이지 예시
});
