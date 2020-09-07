$(function(){
  // sakeの値は変数data(doneないの記述から引数として渡されてる)
  function buildHTML(sake){
    let html =
      `<tr>
        <td>
          ${sake.name}
        <td>
          ${sake.price}
        </td>
        <td>
        ${sake.prefecture}
        </td>
        <td>
          ${sake.comment}
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
});