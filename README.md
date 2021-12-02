# Quiz_SwiftUI1
Práctica 1 de la asignatura IWEB.
Enunciado
Hacer una app usando SwiftUI que muestre y permita jugar con los quizzes contenidos en el fichero p1_quizzes.json. Este fichero está disponible en el moodle de la asignatura.

Los quizzes se deben mostrar usando una view de tipo List, donde cada elemento de esta lista debe mostrar:

La pregunta del quiz.
La imagen adjunta del quiz.
Una estrella iluminada o apagada dependiendo de si el quiz está marcado como favorito o no.
El nombre y la foto del autor.
La lista de quizzes debe usarse con un NavigationView. Use NavigationLinks, para que al pulsar sobre un quiz de la lista, se presente otra pantalla donde se pueda jugar a adivinar la respuesta del quiz seleccionado.

La pantalla de jugar a adivinar un quiz debe mostrar toda la información sobre el quiz seleccionado, excepto su respuesta correcta.

La pantalla de jugar también debe contener un TextField donde el jugador escribirá la respuesta del quiz, y un botón para comprobar si la respuesta introducida es correcta. Después de pulsar en el botón de comprobación, se debe presentar una alerta indicando si la respuesta introducida es correcta o incorrecta.

La pantalla de jugar también debe mostrar un contador que indique cuántos quizzes diferentes se han acertado hasta el momento. Esto puede implementarse manteniendo un array con los id's de los quizzes acertados. La puntuación acumulada del usuario será simplemente el tamaño de ese array.

Todas las pantallas deben mostrar en la NavigationView, un título descriptivo y un botón para volver a la página inicial de la app.

El alumno tiene disponible en el moodle varios ficheros que debe utilizar para hacer esta práctica.

p1_quizzes.json - Es un fichero JSON con los quizzes que hay que usar.
QuizzesModel.swift - Fichero Swift que implementa un modelo que contiene los quizzes cargados del fichero p1_quizzes.json.
QuizItem.swift - Fichero Swift que implementa la struct que representa cada quiz.
NetworkImageView.swift - Implementa una view SwiftUI que pinta la imagen dada su URL.
NetworkImageViewModel.swift - Implementa el ViewModel que necesita NetworkImageView.swift para funcionar.
