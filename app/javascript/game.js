let score = 0;
let correctAnswer = '';
let questionsAnswered = 0;
let totalQuestions = 0;

const quetion_icon = document.getElementById('question-icon');
quetion_icon.addEventListener('click', showQuestion());

function showQuestion() {
    fetch('/get_question')
        .then(response => response.json())
        .then(data => {
            totalQuestions = data.length;

            if (questionsAnswered >= totalQuestions) {
                endGame();
                return;
            }

            const randomIndex = Math.floor(Math.random() * data.length);
            const question = data[randomIndex];

            document.getElementById('question').textContent = question.question;
            document.getElementById('option1').textContent = question.options[0];
            document.getElementById('option2').textContent = question.options[1];
            document.getElementById('option3').textContent = question.options[2];

            correctAnswer = question.answer;

            document.getElementById('question-box').style.display = 'block';
        });
}

function checkAnswer(selectedOptionId) {
    const selectedAnswer = document.getElementById(selectedOptionId).textContent;

    if (selectedAnswer === correctAnswer) {
        alert('Correct answer!');
        score += 10; // Incrementar la puntuación
    } else {
        alert('Wrong answer. Try again!');
    }

    questionsAnswered++;
    document.getElementById('score').textContent = `Score: ${score}`;

    document.getElementById('question-box').style.display = 'none';

    if (questionsAnswered >= totalQuestions) {
        endGame();
    }
}

function endGame() {
    const requiredScore = totalQuestions * 10 * 0.8; // 80% de la puntuación máxima
    if (score >= requiredScore) {
        alert(`Congratulations! You won with a score of ${score}/${totalQuestions * 10}`);
    } else {
        alert(`Game over! You scored ${score}/${totalQuestions * 10}. Better luck next time!`);
    }
}
