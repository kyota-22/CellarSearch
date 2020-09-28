$(function(){
  // sakeの値は変数data(doneないの記述から引数として渡されてる)
  function buildHTML(sake){
    let html =
      `<tr>
        <td>
          ${sake.name}
        </td>
        <td>
          ${sake.price}
        </td>
        <td>
          ${sake.prefecture}
        </td>
        <td>
          ${sake.comment}
        </td>
        <td class='text-center delete_box'>
          <div class="delete_btn remove_list" data-id="${sake.id}">削除</div>
        </td>
      </tr>`
    return html;
  };
  $('.sake_form').on('submit', function(e){
    // 同期通信で送信されないように止める
    e.preventDefault()
    // フォームの中身を代入
    let formData = new FormData(this);
    // 非同期でデータを送る宣言
    $.ajax({
      url: '/sakes',
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
      // appendメソッドでsake_listの一番下にhtmlを差し込ませる
      $('.sake_list').append(html);
      // フォームを空にする記述
      $('form')[0].reset();
      alert("日本酒を追加しました");
      $('.sake_btn').prop('disabled',false);
    })
    .fail(function() {
      alert("日本酒の追加に失敗しました");
    });
  });

  $(".sake_list").on("click", ".delete_btn",function(){
    let sakeId = $(this).data("id");
    $.ajax({
      url: "/sakes/" + sakeId,
      type: 'POST',
      data: {"_method": "DELETE"},
    })
    .done(function(data){
      $(this).parent().remove();
      alert("日本酒を削除しました");
    })
    .fail(function() {
      alert("日本酒の削除に失敗しました");
    });
  });

});