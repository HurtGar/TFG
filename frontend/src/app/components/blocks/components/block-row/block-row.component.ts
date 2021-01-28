import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';
import { Record } from 'src/app/models/record.model';

@Component({
  selector: 'app-block-row',
  templateUrl: './block-row.component.html',
  styleUrls: ['./block-row.component.scss']
})
export class BlockRowComponent implements OnInit {

  @Input() block: Block;
  @Input() lastModification: Record;

  constructor() { }

  ngOnInit(): void {
  }

}
