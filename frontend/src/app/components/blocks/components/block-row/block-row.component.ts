import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';

@Component({
  selector: 'app-block-row',
  templateUrl: './block-row.component.html',
  styleUrls: ['./block-row.component.scss']
})
export class BlockRowComponent implements OnInit {

  @Input() block: Block;

  constructor() { }

  ngOnInit(): void {
  }

}
