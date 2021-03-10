import { Component, Input, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { BlockService } from 'src/app/services/block.service';

@Component({
  selector: 'app-block-view',
  templateUrl: './block-view.component.html',
  styleUrls: ['./block-view.component.scss']
})
export class BlockViewComponent implements OnInit {

  @Input() block: Block;

  constructor(private blockService: BlockService, private router: Router) { }

  ngOnInit(): void {
  }

  deleteBlock(idbloque): void {
    this.blockService.deleteBlock(this.block.idbloque).subscribe(
      (b: Block) => {
        this.router.navigate(['blocks/user/1']);
      },
      (error: any) => {
        console.log(error);
        alert('Este bloque tiene tareas asociadas. No se puede borrar. Borre las tareas asociadas previamente.');
      }
    );
  }
}