let modalOpenButton = document.querySelectorAll(".modal-btn");
let modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

console.log(modalOpenButton);

for(let i = 0; i< modalOpenButton.length; i++) {
    modalOpenButton[i].addEventListener('click', () => {
        modal.classList.remove('hidden');
    });
}

modalCloseButton.addEventListener('click', () => {
    modal.classList.add('hidden');
});