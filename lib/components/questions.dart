class QuisQuestionModel {
  final String question;
  final String correctAnswer;

  final List<String> options;

  QuisQuestionModel(
      {required this.question,
      required this.correctAnswer,
      required this.options});
}

List<QuisQuestionModel> quisQuestions = [
  QuisQuestionModel(
    question: "Qual país sediou a Copa do Mundo de 2018?",
    correctAnswer: "Rússia",
    options: [
      "Brasil",
      "França",
      "Rússia",
      "Alemanha",
    ],
  ),
  QuisQuestionModel(
    question: "Quantas vezes o Brasil venceu a Copa do Mundo de Futebol?",
    correctAnswer: "5",
    options: [
      "3",
      "4",
      "5",
      "6",
    ],
  ),
  QuisQuestionModel(
    question: "Qual jogador é conhecido como 'O Fenômeno'?",
    correctAnswer: "Ronaldo Nazário",
    options: [
      "Neymar",
      "Messi",
      "Cristiano Ronaldo",
      "Ronaldo Nazário",
    ],
  ),
  QuisQuestionModel(
    question: "Qual é o nome do estádio mais famoso do Brasil, localizado no Rio de Janeiro?",
    correctAnswer: "Maracanã",
    options: [
      "Mineirão",
      "Arena Corinthians",
      "Maracanã",
      "Allianz Parque",
    ],
  ),
  QuisQuestionModel(
    question: "Quem é o maior artilheiro da história da Seleção Brasileira de Futebol?",
    correctAnswer: "Pelé",
    options: [
      "Romário",
      "Zico",
      "Neymar",
      "Pelé",
    ],
  ),
  QuisQuestionModel(
    question: "Qual país venceu a primeira edição da Copa do Mundo em 1930?",
    correctAnswer: "Uruguai",
    options: [
      "Argentina",
      "Brasil",
      "Uruguai",
      "Itália",
    ],
  ),
  QuisQuestionModel(
    question: "Qual jogador brasileiro é conhecido como 'O Maestro'?",
    correctAnswer: "Sócrates",
    options: [
      "Zico",
      "Ronaldinho",
      "Sócrates",
      "Kaká",
    ],
  ),
  QuisQuestionModel(
    question: "Quantas Copas do Mundo a seleção brasileira de futebol ganhou de 1990 até 2020?",
    correctAnswer: "0",
    options: [
      "1",
      "2",
      "3",
      "0",
    ],
  ),
   QuisQuestionModel(
    question: "Qual é o jogador mais caro da história do futebol?",
    correctAnswer: "Neymar",
    options: [
      "Cristiano Ronaldo",
      "Lionel Messi",
      "Neymar",
      "Kylian Mbappé",
    ],
  ),
  QuisQuestionModel(
    question: "Qual país venceu a Copa do Mundo de 2014?",
    correctAnswer: "Alemanha",
    options: [
      "Brasil",
      "Espanha",
      "Argentina",
      "Alemanha",
    ],
  ),
];


