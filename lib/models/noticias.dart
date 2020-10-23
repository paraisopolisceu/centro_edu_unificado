class Noticias {
  String _titulo;
  String _foto;
  String _evento;
  String _dataEvento;

  Noticias({String titulo, String foto, String evento, String dataEvento}) {
    this._titulo = titulo;
    this._foto = foto;
    this._evento = evento;
    this._dataEvento = dataEvento;
  }

  String get titulo => _titulo;
  set titulo(String titulo) => _titulo = titulo;
  String get foto => _foto;
  set foto(String foto) => _foto = foto;
  String get evento => _evento;
  set evento(String evento) => _evento = evento;
  String get dataEvento => _dataEvento;
  set dataEvento(String dataEvento) => _dataEvento = dataEvento;

  Noticias.fromJson(Map<String, dynamic> json) {
    _titulo = json['titulo'];
    _foto = json['foto'];
    _evento = json['evento'];
    _dataEvento = json['data_evento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this._titulo;
    data['foto'] = this._foto;
    data['evento'] = this._evento;
    data['data_evento'] = this._dataEvento;
    return data;
  }
}