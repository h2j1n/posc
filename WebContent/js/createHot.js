// 부모 요소를 생성하고 클래스를 추가합니다.

for(let i=0; i<6; i++){
const parentDiv = document.createElement('div');
parentDiv.classList.add('hot', 'border', 'border-primary', 'rounded', 'position-relative', 'vesitable-item');

// 상위 div
const topDiv = document.createElement('div');
topDiv.classList.add('top');

// 상위 div에 자식 요소 추가
const studyOrProDiv = document.createElement('div');
studyOrProDiv.classList.add('Study_or_Pro');
topDiv.appendChild(studyOrProDiv);

const newOrHotDiv = document.createElement('div');
newOrHotDiv.classList.add('New_or_Hot');
topDiv.appendChild(newOrHotDiv);

const fillOrEmptyDiv = document.createElement('div');
fillOrEmptyDiv.classList.add('Fill_or_Empty');
topDiv.appendChild(fillOrEmptyDiv);

// 중간 div
const middleDiv = document.createElement('div');
middleDiv.classList.add('middle');

// end_date div
const endDateDiv = document.createElement('div');
endDateDiv.classList.add('end_date');
const endDateP = document.createElement('p');
endDateP.classList.add('end_date_text');
endDateP.textContent = '마김일 | 2024-05-06';
endDateDiv.appendChild(endDateP);
middleDiv.appendChild(endDateDiv);

// title div
const titleDiv = document.createElement('div');
titleDiv.classList.add('title', 'p-4', 'rounded-bottom');
const titleP = document.createElement('p');
titleP.classList.add('title_text');
titleP.textContent = '모집글 제목';
titleDiv.appendChild(titleP);
middleDiv.appendChild(titleDiv);

// 하위 div
const bottomDiv = document.createElement('div');
bottomDiv.classList.add('bottom');

// user_id div
const userIdDiv = document.createElement('div');
userIdDiv.classList.add('user_id');
const userIdP = document.createElement('p');
userIdP.classList.add('user_id_text');
userIdP.textContent = 'userId';
userIdDiv.appendChild(userIdP);
bottomDiv.appendChild(userIdDiv);

// hit div
const hitDiv = document.createElement('div');
hitDiv.classList.add('hit');
const hitImg = document.createElement('img');
hitDiv.appendChild(hitImg);
const hitP = document.createElement('p');
hitP.classList.add('hit_text');
hitP.textContent = '05';
hitDiv.appendChild(hitP);
bottomDiv.appendChild(hitDiv);

// comment_cnt div
const commentCntDiv = document.createElement('div');
commentCntDiv.classList.add('comment_cnt');
const commentCntImg = document.createElement('img');
commentCntDiv.appendChild(commentCntImg);
const commentCntP = document.createElement('p');
commentCntP.textContent = '10';
commentCntDiv.appendChild(commentCntP);
bottomDiv.appendChild(commentCntDiv);

// 부모 div에 상위, 중간, 하위 div 추가
parentDiv.appendChild(topDiv);
parentDiv.appendChild(middleDiv);
parentDiv.appendChild(document.createElement('hr'));
parentDiv.appendChild(bottomDiv);

// body에 부모 div 추가
document.body.appendChild(parentDiv);
}