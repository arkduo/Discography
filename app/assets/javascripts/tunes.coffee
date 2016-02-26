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
      { "data": "mp3.url" }
    ]

  $('#datatables').dataTable
    "processing": true, # 処理中の表示
    "order": [[1, 'asc']]
    "columnDefs": [ # 検索対象外に設定
      { "targets": 1, "searchable": false }, # tracknum
      { "targets": 5, "searchable": false }, # mp3
    ]
    
  $('audio#play').mediaelementplayer()
  $('audio#playlist').mediaelementplayer
    "loop": false,
    "shuffle": false,
    "playlist": true,
    "audioHeight": 30,
    "playlistposition": "bottom",
    "features": [
      'playlistfeature',
      'prevtrack',
      'playpause',
      'nexttrack',
      'loop',
      'shuffle',
      'playlist',
      'current',
      'progress',
      'duration',
      'volume'
    ]
