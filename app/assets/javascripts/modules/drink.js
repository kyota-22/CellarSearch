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
        <td class='text-center delete_box'>
          <div class="delete_btn remove_list" data-id="${drink.id}">削除</div>
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
      // フォームを空にする記述
      $('form')[0].reset();
      alert("ドリンクを追加しました");
      $('.drink_btn').prop('disabled',false);
    })
    .fail(function() {
      alert("ドリンクの追加に失敗しました");
    });
  });

  // 全然できてない(ajaxのtypeはGETもしくはPOSTしか使えない)
  $(".drink_list").on("click", ".delete_btn",function(){
    // let drinkId = $(this).data(drink.id)
    let drinkId = $(this).data("id");
    $.ajax({
      url: "/drinks/" + drinkId,
      type: 'POST',
      data: {"_method": "DELETE"},
    })
    .done(function(data){
      $(this).parent().remove();
      alert("ドリンクを削除しました");
    })
    .fail(function() {
      alert("ドリンクの削除に失敗しました");
    });
  });
});