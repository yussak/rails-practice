import React from "react";

// 徐々にこちらを増やしてく
const Form = () => {
  return (
    <>
      <div>
        <label htmlFor="user_name">名前</label>
        <input type="text" name="user[name]" id="user_name" required />
      </div>

      <div>
        <label htmlFor="user_email">メールアドレス</label>
        <input type="email" name="user[email]" id="user_email" required />
      </div>
    </>
  );
};

export default Form;
