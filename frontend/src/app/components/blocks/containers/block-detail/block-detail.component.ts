import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Block } from 'src/app/models/block.model';
import { Task } from 'src/app/models/task.model';
import { BlockService } from 'src/app/services/block.service';

@Component({
  selector: 'app-block-detail',
  templateUrl: './block-detail.component.html',
  styleUrls: ['./block-detail.component.scss'],
})
export class BlockDetailComponent implements OnInit {
  blocks: Block;
  tasks: Task;

  constructor(
    private blockService: BlockService,
    private router: ActivatedRoute
  ) {
    this.router.params.subscribe((param) => {
      this.getOneBlockFromAProjectAndUser(param.idBlock, param.idUser);
    });
    this.router.params.subscribe((param) => {
      this.getAllTasksFromABlock(param.idBlock);
    });
  }

  ngOnInit(): void {}

  public getOneBlockFromAProjectAndUser(idBlock: string, idUser: string): void {
    this.blockService
      .getOneBlockFromAProjectAndUser(idBlock, idUser)
      .subscribe((block) => {
        this.blocks = block;
        console.log(block);
      });
  }
  public getAllTasksFromABlock(idBlock: string): void {
    this.blockService.getAllTasksFromABlock(idBlock).subscribe((task) => {
      this.tasks = task;
      console.log(task);
    });
  }
}
