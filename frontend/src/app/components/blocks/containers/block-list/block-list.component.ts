import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { BlockService } from 'src/app/services/block.service';

@Component({
  selector: 'app-block-list',
  templateUrl: './block-list.component.html',
  styleUrls: ['./block-list.component.scss']
})
export class BlockListComponent implements OnInit {

  blocks: Block[] = [];

  constructor(private blockService: BlockService, private router: ActivatedRoute) {
    this.router.params.subscribe((param) => {
      this.getAllBlocksFromAnUser(param.idUsuario);
    });
  }

  ngOnInit(): void {
  }

  //Mirar project-list para la última fecha de modificación.
  public getAllBlocksFromAnUser(idUsuario: string): void{
    this.blockService.getAllBlocksFromAnUser(idUsuario).subscribe((block)=>{
      this.blocks = block;
    });
  }

}
