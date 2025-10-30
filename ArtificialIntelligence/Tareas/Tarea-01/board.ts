// export default (function () {

//     return {}
// })();

interface Position {
    row: number;
    col: number;
}

class Board {
    private table: HTMLTableElement;
    private board: Array<Array<HTMLTableCellElement>>;
    private boardSize: number;
    private blankPosition: Position;
    constructor(table: HTMLTableElement, boardSize: number) {
        this.table = table;
        this.boardSize = boardSize;
        this.board = [];
    }

    makeBoard() {
        // clean Board
        this.table.innerHTML = '';

        const boardSize = this.boardSize;
        const table = this.table;
        const squares = this.board;

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
            table.appendChild(tableRow);
        }
        // if (table.lastChild != null) {
        //     squares[squares.length - 1].pop();
        //     const lastRow = table.lastChild;
        //     if (lastRow.lastChild)
        //         lastRow.removeChild(lastRow.lastChild);
        // }

        for (const row of squares) {
            for (const square of row) {
                square.style.height = '20px';
                square.style.width = '20px';
                square.style.backgroundColor = 'red'
            }
        }
        let last = squares.at(-1)?.at(-1);
        if (last) {
            last.innerText = '';
        }
        if (last?.style) {
            last.style.backgroundColor = '';
        }
        this.blankPosition = { row: boardSize - 1, col: boardSize - 1 };
        this.board = squares;

    }
    get size(){
        return this.boardSize;
    }
    /**
     * Swap the css and text of the squares
     * @param pos1 Position in the board
     * @param pos2 Position in the board
     */
    swap(pos1: Position, pos2: Position) {
        const square1 = this.board.at(pos1.row)?.at(pos1.col);
        const square2 = this.board.at(pos2.row)?.at(pos2.col);

        const style = square1?.style.cssText;
        const text = square1?.innerText;

        if (square1) {
            square1.style = square2?.style.cssText;
            square1.innerText = square2?.innerText;
        }
        if (square2) {
            square2.style = style;
            square2.innerText = text;
        }


    }

    move(direction: string) {
        const { row, col } = this.blankPosition;
        if (direction == 'up') {
            if (row > 0) {
                this.swap({ row: row - 1, col }, { row, col });
                this.blankPosition.row -= 1;
            }
        } else if (direction == "down") {
            if (row < this.boardSize - 1) {
                this.swap({ row: row + 1, col }, { row, col });
                this.blankPosition.row += 1;
            }
        } else if (direction == "left") {
            if (col > 0) {
                this.swap({ row, col: col - 1 }, { row, col });
                this.blankPosition.col -= 1;
            }
        } else if (direction == "right") {
            if (col < this.boardSize - 1) {
                this.swap({ row, col: col + 1 }, { row, col });
                this.blankPosition.col += 1;
            }
        }
    }
    on(event: InputEvent) {

    }
}

export { Board };