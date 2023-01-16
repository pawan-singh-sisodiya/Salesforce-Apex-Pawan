import { LightningElement, track, wire } from 'lwc';
import profileList from '@salesforce/apex/SearchUserFromProfileController.profileMethod';
export default class SearchUserFromProfile extends LightningElement {

@track profileRecords;
profileRecordsTemp;
searchText;
@track totalsize;

    @wire(profileList)
    getProgiles({data, error}){
        if(data){
            this.profileRecords = data;
            this.profileRecordsTemp = data;
            this.totalsize = this.profileRecords.length;
        }
        else if(error){
            console.log('error handled', error);
        }
        
    }

    handleChange(event){
        this.searchText = event.target.value;
        console.log('Search Text-', this.searchText);
    }

    searchHandle(){
        if(this.searchText){
            this.searchText.toLowercase;
        this.profileRecords = this.profileRecordsTemp.filter(con =>con.Name.indexOf(this.searchText) !== -1);
        }
        this.countMethod();
    }
    countMethod(){
        this.totalsize = this.profileRecords.length;
    }
}