import { LightningElement } from 'lwc';

export default class HelloQuerySelectorDemo extends LightningElement {
    userNames =['Amol','Ganesh','Ravi','Sangeeta'];
    fetchDetailHandler(){
        const elem = this.template.querySelector('h1');
        console.log(elem.innerText);
        const userElem = this.template.querySelectorAll('.name')
        Array.from(userElem).forEach(item=>{
            console.log(item.innerText);
            item.setAttribute('title', item.innerText);
        })

        const childElem = this.template.querySelector('.child');
        childElem.innerHTML='<p> I am a Child </p>'
    }
}