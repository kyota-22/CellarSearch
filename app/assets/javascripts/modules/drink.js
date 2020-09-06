$(function(){
  // drinkの値は変数data(doneないの記述から引数として渡されてる)
  function buildHTML(drink){
    let html =
      `<tr>
        <td>
          ${drink.name}
        <td>
          ${drink.price}
        </td>
        <td>
          ${drink.comment}
        </td>
      </tr>`
    return html;
  };
  $('.drink_form').on('submit', function(e){
    // 同期通信で送信されないように止める
    e.preventDefault()
    // フォームの中身を代入
    let formData = new FormData(this);
    // 非同期でデータを送る宣言
    $.ajax({
      url: '/drinks',
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
      $('.drink_list').append(html);
      // フォームをからにする記述
      $('form')[0].reset();
      alert("ドリンクを追加しました");
      $('.drink_btn').prop('disabled',false);
    })
    .fail(function() {
      alert("ドリンクの追加に失敗しました");
    });
  });
});