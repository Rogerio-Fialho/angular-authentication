import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  identityLogin() {
    window.location.href = 'https://mingle.customerfi.com/cloudpass/launchpad/launchApp/dc30a25d3b9211eabc68be6b0796fb68/dc62500c362d11ea96442eb78d27db37'
  }

}
