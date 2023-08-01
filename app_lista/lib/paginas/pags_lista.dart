import 'package:flutter/material.dart';

class Pagina_lista extends StatefulWidget {
  @override
  State<Pagina_lista> createState() => _Pagina_listaState();
}

class _Pagina_listaState extends State<Pagina_lista> {
  final TextEditingController mensagensControlador = TextEditingController();

  List<String> Mensagens = [];

  void adicionarMensagem() {
    String algumasmensagens = mensagensControlador.text;
    mensagensControlador.clear();
    setState(() {
      Mensagens.add(algumasmensagens); // Adicionando valores na lista Mensagens
    });
  }

  void limparMensagens() {
    setState(() {
      Mensagens.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(113, 247, 212, 233),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Lista de Tarefas",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: mensagensControlador,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Adicione uma tarefa",
                        hintText: "Digite aqui",
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: adicionarMensagem,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 111, 2, 87),
                      padding: EdgeInsets.all(20),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    for (String mensagem in Mensagens)
                      ListTile(
                        title: Text(mensagem),
                        subtitle: Text("Maria Eduarda Moreno"),
                        leading: Icon(
                          Icons.question_mark,
                          size: 30,
                        ),
                        onTap: () {
                          print("Mensagem: $mensagem");
                        },
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text("Você possui ${Mensagens.length} tarefas pendentes"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: limparMensagens,
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 111, 2, 87),
                      padding: EdgeInsets.all(20),
                    ),
                    child: Text("Limpar"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}