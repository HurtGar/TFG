import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';
import { BlockService } from 'src/app/services/block.service';


@Component({
  selector: 'app-block-available',
  templateUrl: './block-available.component.html',
  styleUrls: ['./block-available.component.scss'],
})
export class BlockAvailableComponent implements OnInit {
  @Input() blocks: Block[];
  userId: string;

  constructor(private blockService: BlockService) {}

  ngOnInit(): void {
    this.userId = localStorage.getItem('userId');
  }

}
