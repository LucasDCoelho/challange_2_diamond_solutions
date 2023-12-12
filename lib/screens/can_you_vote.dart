import "package:flutter/material.dart";


class CanYouVote extends StatefulWidget {

  const CanYouVote({super.key});

  @override
  State<CanYouVote> createState() => _CanYouVoteState();
}

class _CanYouVoteState extends State<CanYouVote> {
  DateTime selectedDate = DateTime.now();
  DateTime nowDate = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Você pode votar?"),
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: SizedBox(
                    width: 300,
                    child: Text(
                      "Me diga sua data de aniversário, para se saber você é obrigado a votar!",
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Visibility(
                      visible: nowDate.year - selectedDate.year >= 18,
                      child: const Text("Você é obrigado a votar esse ano!", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),)),
                  Visibility(
                      visible: nowDate.year - selectedDate.year < 18,
                      child: const Text("Você não é obrigado a votar nesse ano!", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),)),
                ]),
              ),
              Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
              ElevatedButton(
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: nowDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(2100),
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                    );

                    if (dateTime != null) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                  child: const Text("Selecione sua data de nascimento"))
            ],
          ),
            ),
      ),
    );
  }
}
