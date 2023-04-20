import { LightningElement } from 'lwc';
import LOCALE from '@salesforce/i18n/locale';
import CURRENCY from '@salesforce/i18n/currency';
import DIR from '@salesforce/i18n/dir'

export default class Intenalionalization extends LightningElement {
    dir = DIR
    number = 6575557.86
    formattedNumber = new Intl.NumberFormat(LOCALE,{
        style : 'currency',
        currency :CURRENCY,
        currencyDisplay : 'symbol'
    }).format(this.number)
}