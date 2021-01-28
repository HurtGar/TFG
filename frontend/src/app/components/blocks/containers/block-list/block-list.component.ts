import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Record } from 'src/app/models/record.model';
import { BlockService } from 'src/app/services/block.service';
import { RecordModificationService } from 'src/app/services/record-modification.service';

@Component({
  selector: 'app-block-list',
  templateUrl: './block-list.component.html',
  styleUrls: ['./block-list.component.scss'],
})
export class BlockListComponent implements OnInit {
  blocks: Block[] = [];
  lastModification: Record[] = [];

  constructor(
    private blockService: BlockService,
    private recordService: RecordModificationService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getAllBlocksFromAnUser(param.idUsuario);
    });
  }

  ngOnInit(): void {}

  //Mirar project-list para la última fecha de modificación.
  public getAllBlocksFromAnUser(idUsuario: string): void {
    let i = 0;
    this.blockService.getAllBlocksFromAnUser(idUsuario).subscribe((block) => {
      this.blocks = block;
      this.recordService
        .getRecordsChangesFromBlock(block[i].idbloque)
        .subscribe((record) => {
          this.lastModification = record;
        });
      i += 1;
    });
  }
}
