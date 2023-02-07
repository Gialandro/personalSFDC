/**
 * @description       : 
 * @author            : gialandros@gmail.com
 * @last modified on  : 07/02/2023
 * @last modified by  : gialandros@gmail.com
**/
import { LightningElement, api } from 'lwc';
import userId from '@salesforce/user/Id';

export default class FirstLWC extends LightningElement {
	@api source;
	@api recordId;
	constructor (){
		super();
		console.log('tests');
	}
}