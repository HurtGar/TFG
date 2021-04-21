import { Component, Input, OnInit } from '@angular/core';
import { Block } from 'src/app/models/block.model';
import { HistoricalModificationBlock } from 'src/app/models/historial-modification-block.model';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-block-history',
  templateUrl: './block-history.component.html',
  styleUrls: ['./block-history.component.scss'],
})
export class BlockHistoryComponent implements OnInit {
  @Input() block: Block;
  modifications: HistoricalModificationBlock[];

  constructor(private recordsService: RecordModificationService) {}

  ngOnInit(): void {
    this.getAllRecordsBlock(this.block.idbloque);
  }

  getAllRecordsBlock(idBlock: number): any {
    this.recordsService.getAllRecordsBlock(idBlock).subscribe((b) => {
      this.modifications = b;
    });
  }
}
