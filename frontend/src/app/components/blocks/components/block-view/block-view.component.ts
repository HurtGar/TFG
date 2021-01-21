import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';

@Component({
  selector: 'app-block-view',
  templateUrl: './block-view.component.html',
  styleUrls: ['./block-view.component.scss']
})
export class BlockViewComponent implements OnInit {

  @Input() block: Block;

  constructor() { }

  ngOnInit(): void {
  }

}
