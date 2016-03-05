var startCell = null;
var lists = []; // 選択された行の値を格納する配列
// マウスダウンのイベント処理
function mouseDown(table, e){
    if (!e) var e = window.event;
    startCell = e.srcElement? e.srcElement: e.target;
    if(startCell.tagName != "TD"){
        startCell = null;
        return;
    }
    mouseMove(table, e);
}

// マウス移動のイベント処理
function mouseMove(table, e){
    if (!e) var e = window.event;
 
    var endCell = e.srcElement?e.srcElement:e.target;
    if(!(endCell.tagName=="TD" && startCell))
        return false;
 
    // セルの位置を取得
    var from = getCellPos(table, startCell);
    var to = getCellPos(table, endCell);
    if(!from || !to)
        return false;
 
    // 色を変更
    var x, y, cells;
    for(y=0; y<table.rows.length; y++){
        row = table.rows.item(y);
        if((from.row-y)*(y-to.row)>=0)
          row.style.backgroundColor = "#ffdddd";// 選択状態の色
        else
          row.style.backgroundColor = "transparent";// 未選択状態の色
    }
}

// tableの中のcellの位置を取得する
function getCellPos(table, cell){
    var pos = new Object();
    if(cell.nodeName == "TD"){
        var x, y, cells;
        for(y=0; y<table.rows.length; y++){
            row = table.rows.item(y);
            for(x=0; x<row.cells.length; x++){
                if(row.cells.item(x) == cell){
                    pos.row = y;
                    pos.col = x;
                    return pos;
                }
            }
        }
    }
    return null;
}

// マウスアップのイベント処理
function mouseUp(table, e){
    if (!e) var e = window.event;
     
    var endCell = e.srcElement?e.srcElement:e.target;
    if(!(endCell.tagName=="TD" && startCell))
        return false;
     
    // セルの位置を取得
    var from = getCellPos(table, startCell);
    var to = getCellPos(table, endCell);
    if(!from || !to)
        return false;
     
    // mouseMoveで選択状態表示の更新をさせないようにする
    startCell = null;
    
    // 表示されているデータをすべて取得
    var table = $('#datatables').DataTable();
    
    // 値の小さい方をstartに
    var start = from.row < to.row ? from.row : to.row;
    var end = to.row > from.row ? to.row : from.row;
    
    for (line=start-1; line<end; line++){
      table.rows().data().each(function(value, index){
          if(index == line){lists.push(value)}; // 選択された行なら配列に追加
      });
    };
    console.log(lists);
}

// onclickで呼び出される関数
function sendList(){
  if(lists.length < 1)
    return false;
  
  // action: playlistへlistsの値を送信
  $.ajax({
    url: '/tunes/playlist',
    type: 'POST',
    data: { list: lists },
    dataType: 'html'
  });
    
  // 初期化
  lists = [];
}
