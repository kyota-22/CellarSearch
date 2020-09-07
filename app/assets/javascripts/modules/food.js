$(function(){
  // drinkの値は変数data(doneないの記述から引数として渡されてる)
  function buildHTML(food){
    let html =
      `<tr>
        <td>
          ${food.name}
        <td>
          ${food.price}
        </td>
        <td>
          ${food.comment}
        </td>
      </tr>`
    return html;
  };
  $('.food_form').on('submit', function(e){
    // 同期通信で送信されないように止める
    e.preventDefault()
    // フォームの中身を代入
    let formData = new FormData(this);
    // 非同期でデータを送る宣言
    $.ajax({
      url: '/foods',
      type: 'POST',
      data: formData,  
      dataType: 'json',
      processData: false,
      contentType: false
    })
    // create.json.jbuilderから正しい値が帰ってきたらdoneを実行
    .done(function(data){
      // buildHTMLメソッドに引数として変数dataを渡し、buildHTMLメソッドの返り値を変数htmlに代入
      let html = buildHTML(data);
      // appendメソッドでdrink_listの一番下にhtmlを差し込ませる
      $('.food_list').append(html);
      // フォームをからにする記述
      $('form')[0].reset();
      alert("フードを追加しました");
      $('.food_btn').prop('disabled',false);
    })
    .fail(function() {
      alert("フードの追加に失敗しました");
    });
  });
});