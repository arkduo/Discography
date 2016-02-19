# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#tunes').dataTable
    "processing": true, # 処理中の表示
    "serverSide": true, # サーバサイドへ Ajax するか
    "ajax": "list", # Ajax の通信先
    "columns": [ # 扱うカラムの指定
      { "data": "name" },
      { "data": "artist" },
    ]
