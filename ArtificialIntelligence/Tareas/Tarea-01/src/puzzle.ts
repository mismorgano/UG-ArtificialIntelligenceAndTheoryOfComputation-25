import { Board } from './board.js';

const play = document.getElementById('playId');
let board: Board;
play?.addEventListener("click", () => {
    const level = document.getElementById('level') as HTMLInputElement;
    const boardElement = document.getElementById('board') as HTMLTableElement;

    let boardSize = level.valueAsNumber;

    // makeBoard(boardElement, boardSize, {});
    board = new Board(boardElement, boardSize);
    console.log(board)
    board.makeBoard();

    // for (const row of board) {
    //     for (const square of row) {
    //         square.style.height = '20px';
    //         square.style.width = '20px';
    //         square.style.backgroundColor = 'red'
    //     }
    // }

});
document.addEventListener("DOMContentLoaded", main);

document.addEventListener('keydown', (event) => {
    if (event.key === "ArrowUp") {
        board.move('up');
    } else if (event.key === "ArrowDown") {
        board.move('down');
    } else if (event.key === "ArrowLeft") {
        board.move('left');
    } else if (event.key === "ArrowRight") {
        board.move('right');
    }
});
function main() {

    // document.addEventListener("click")    
}

function makeBoard(board: HTMLTableElement, boardSize: number, params: object) {

    board.innerHTML = '';

    console.log(boardSize)

    let squares = [];

    for (let i = 0; i < boardSize; i++) {
        let row = []
        let tableRow = document.createElement('tr');

        for (let j = 0; j < boardSize; j++) {
            const dataCell = document.createElement("td")

            tableRow.appendChild(dataCell);
            row.push(dataCell);

            dataCell.id = `${squares.length * boardSize + row.length}`;
            dataCell.textContent = dataCell.id;
        }
        squares.push(row);
        board.appendChild(tableRow)
    }
    if (board.lastChild != null) {
        squares[squares.length - 1].pop();
        const lastRow = board.lastChild;
        if (lastRow.lastChild)
            lastRow.removeChild(lastRow.lastChild);
    }

    return squares;
}