import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { BlockService } from 'src/app/services/block.service';

@Component({
  selector: 'app-block-form',
  templateUrl: './block-form.component.html',
  styleUrls: ['./block-form.component.scss']
})
export class BlockFormComponent implements OnInit {

  constructor(private blockService: BlockService, private router: ActivatedRoute) { }

  ngOnInit(): void {
  }

}
